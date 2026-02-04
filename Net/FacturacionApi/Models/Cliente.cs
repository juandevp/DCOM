using System.ComponentModel.DataAnnotations;

public class Clientes
{
    [Key]
    public int Cliente { get; set; }
    public string Nombre_Cliente { get; set; }
    public string Direccion { get; set; }
}
