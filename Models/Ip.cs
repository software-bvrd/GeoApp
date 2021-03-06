using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace GeoApp.Models
{
    public partial class Ip
    {
        public string Network { get; set; }
        public string GeonameId { get; set; }
        public string RegisteredCountryGeonameId { get; set; }
        public string RepresentedCountryGeonameId { get; set; }
        public string IsAnonymousProxy { get; set; }
        public string IsSatelliteProvider { get; set; }
    }
}
