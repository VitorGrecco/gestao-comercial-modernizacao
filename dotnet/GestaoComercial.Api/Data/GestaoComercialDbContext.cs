using GestaoComercial.Api.Models;
using Microsoft.EntityFrameworkCore;

namespace GestaoComercial.Api.Data;

public class GestaoComercialDbContext : DbContext
{
    public GestaoComercialDbContext(
        DbContextOptions<GestaoComercialDbContext> options)
        : base(options)
    {
    }

    public DbSet<Cliente> Clientes { get; set; }
}