using Microsoft.AspNetCore.Mvc;
[ApiController]
[Route("api/clientes")]
public class ClientesController : ControllerBase
{
    private readonly FacturacionContext context;
    public ClientesController(FacturacionContext context) { this.context = context; }

    [HttpPost]
    public async Task<IActionResult> Post(Clientes cliente)
    {
        context.Clientes.Add(cliente);
        await context.SaveChangesAsync();
        return Ok(cliente);
    }
}
