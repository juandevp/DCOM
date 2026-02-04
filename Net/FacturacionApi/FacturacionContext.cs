using Microsoft.EntityFrameworkCore;
public class FacturacionContext : DbContext
{
    public FacturacionContext(DbContextOptions<FacturacionContext> options) : base(options) {}
    public DbSet<Clientes> Clientes { get; set; }
    public DbSet<Producto> Productos { get; set; }
    public DbSet<Cabeza_Factura> Cabeza_Factura { get; set; }
    public DbSet<DetalleFactura> DetalleFacturas { get; set; }
}
