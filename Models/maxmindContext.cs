using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace GeoApp.Models
{
    public partial class maxmindContext : DbContext
    {
       // internal object Vcountrygeos;

        public maxmindContext()
        {
        }

        public maxmindContext(DbContextOptions<maxmindContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Country> Country { get; set; }
        public virtual DbSet<Ip> Ip { get; set; }
        public virtual DbSet<Vcountrygeo> Vcountrygeo { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=172.17.0.2;Database=maxmind;User Id=sa;Password=AwesomePassword!");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Country>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("country");

                entity.Property(e => e.ContinentCode)
                    .HasColumnName("continent_code")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ContinentName)
                    .HasColumnName("continent_name")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.CountryIsoCode)
                    .HasColumnName("country_iso_code")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.CountryName)
                    .HasColumnName("country_name")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.GeonameId)
                    .HasColumnName("geoname_id")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.IsInEuropeanUnion)
                    .HasColumnName("is_in_european_union")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.LocaleCode)
                    .HasColumnName("locale_code")
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Ip>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("ip");

                entity.Property(e => e.GeonameId)
                    .HasColumnName("geoname_id")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.IsAnonymousProxy)
                    .HasColumnName("is_anonymous_proxy")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.IsSatelliteProvider)
                    .HasColumnName("is_satellite_provider")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Network)
                    .HasColumnName("network")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.RegisteredCountryGeonameId)
                    .HasColumnName("registered_country_geoname_id")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.RepresentedCountryGeonameId)
                    .HasColumnName("represented_country_geoname_id")
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Vcountrygeo>(entity =>
            {
                //entity.HasNoKey();
                entity.HasKey(x => x.Network);
                entity.ToView("vcountrygeo");

                entity.Property(e => e.ContinentCode)
                    .HasColumnName("continent_code")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ContinentName)
                    .HasColumnName("continent_name")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.CountryIsoCode)
                    .HasColumnName("country_iso_code")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.CountryName)
                    .HasColumnName("country_name")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.GeonameId)
                    .HasColumnName("geoname_id")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.IsAnonymousProxy)
                    .HasColumnName("is_anonymous_proxy")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.IsInEuropeanUnion)
                    .HasColumnName("is_in_european_union")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.IsSatelliteProvider)
                    .HasColumnName("is_satellite_provider")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.LocaleCode)
                    .HasColumnName("locale_code")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Network)
                    .HasColumnName("network")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.RegisteredCountryGeonameId)
                    .HasColumnName("registered_country_geoname_id")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.RepresentedCountryGeonameId)
                    .HasColumnName("represented_country_geoname_id")
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
