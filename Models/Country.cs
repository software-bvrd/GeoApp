using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace GeoApp.Models
{
    public partial class Country
    {
        public string GeonameId { get; set; }
        public string LocaleCode { get; set; }
        public string ContinentCode { get; set; }
        public string ContinentName { get; set; }
        public string CountryIsoCode { get; set; }
        public string CountryName { get; set; }
        public string IsInEuropeanUnion { get; set; }
    }
}
