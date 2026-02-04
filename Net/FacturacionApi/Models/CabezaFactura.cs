using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

public class Cabeza_Factura
{
    [Key]
    public int Numero { get; set; }
    public DateTime Fecha { get; set; }
    public int Cliente_Id { get; set; }
    public decimal Total { get; set; }
}
