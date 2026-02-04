using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
[ApiController]
[Route("api/facturas")]
public class FacturasController : ControllerBase
{
    private readonly FacturacionContext context;
    public FacturasController(FacturacionContext context) { this.context = context; }

    [HttpGet("{numero}")]
    public async Task<IActionResult> Get(int numero)
    {
        var factura = await context.Cabeza_Factura
            .FirstOrDefaultAsync(f => f.Numero == numero);
        if (factura == null) return NotFound();
        return Ok(factura);
    }
}
