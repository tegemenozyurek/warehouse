using Essentials.Models;
using Microsoft.EntityFrameworkCore;

namespace Essentials.Data;

public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options) { }
    
    public DbSet<Product> Products { get; set; }
    public DbSet<Warehouse> Warehouses { get; set; }
    public DbSet<StockMovement> StockMovements { get; set; }
    public DbSet<WarehouseStock> WarehouseStocks { get; set; }
}

