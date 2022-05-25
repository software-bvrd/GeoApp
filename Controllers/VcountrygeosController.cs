using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using GeoApp.Models;

namespace GeoApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VcountrygeosController : ControllerBase
    {
        private readonly maxmindContext _context;

        public VcountrygeosController(maxmindContext context)
        {
            _context = context;
        }

        // GET: api/Vcountrygeos
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Vcountrygeo>>> GetVcountrygeos()
        {
            return await _context.Vcountrygeo.ToListAsync();
        }

        // GET: api/Vcountrygeos/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Vcountrygeo>> GetVcountrygeo(string id)
        {
            var vcountrygeos = await _context.Vcountrygeo.FindAsync(id);

            if (vcountrygeos == null)
            {
                return NotFound();
            }

            return vcountrygeos;
        }

        // PUT: api/Vcountrygeos/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutVcountrygeo(string id, Vcountrygeo vcountrygeo)
        {
            if (id != vcountrygeo.Network)
            {
                return BadRequest();
            }

            _context.Entry(vcountrygeo).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!VcountrygeoExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Vcountrygeos
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.         
        [HttpPost]
        public async Task<ActionResult<IEnumerable<Vcountrygeo>>> PostipsList(string input)
        {
            string StoredProc = "exec sp_countrygeo " + "@ips = '" + input  +"'";
            return await _context.Vcountrygeo.FromSqlRaw(StoredProc).ToListAsync();
        }
         
        // DELETE: api/Vcountrygeos/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Vcountrygeo>> DeleteVcountrygeo(string id)
        {
            var vcountrygeo = await _context.Vcountrygeo.FindAsync(id);
            if (vcountrygeo == null)
            {
                return NotFound();
            }

            _context.Vcountrygeo.Remove(vcountrygeo);
            await _context.SaveChangesAsync();

            return vcountrygeo;
        }

        private bool VcountrygeoExists(string id)
        {
            return _context.Vcountrygeo.Any(e => e.Network == id);
        }
    }
}
