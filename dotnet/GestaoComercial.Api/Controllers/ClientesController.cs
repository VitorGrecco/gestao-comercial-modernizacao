using GestaoComercial.Api.Data;
using GestaoComercial.Api.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace GestaoComercial.Api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ClientesController : ControllerBase
{
    private readonly GestaoComercialDbContext _context;

    public ClientesController(GestaoComercialDbContext context)
    {
        _context = context;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<Cliente>>> Get()
    {
        var clientes = await _context.Clientes
            .OrderBy(cliente => cliente.Nome)
            .ToListAsync();

        return Ok(clientes);
    }
}