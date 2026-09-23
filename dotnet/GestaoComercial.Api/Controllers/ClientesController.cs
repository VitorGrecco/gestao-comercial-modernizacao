using GestaoComercial.Api.Data;
using GestaoComercial.Api.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using GestaoComercial.Api.DTOs;

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

    [HttpGet("{id:int}")]
    public async Task<ActionResult<Cliente>> GetPorId(int id)
    {
        var cliente = await _context.Clientes.FindAsync(id);

        if (cliente is null)
            return NotFound();

        return Ok(cliente);
    }

    [HttpPost]
    public async Task<ActionResult<Cliente>> Post(ClienteCreateDto clienteDto)
    {   
        var cliente = new Cliente
        {
            Nome = clienteDto.Nome.Trim(),
            Documento = clienteDto.Documento,
            Email = clienteDto.Email,
            Telefone = clienteDto.Telefone,
            Ativo = clienteDto.Ativo,
            DataCadastro = DateTime.Now
        };

        _context.Clientes.Add(cliente);

        await _context.SaveChangesAsync();

        return CreatedAtAction(
            nameof(GetPorId),
            new { id = cliente.IdCliente },
            cliente
        );
    }

    [HttpPut("{id:int}")]
    public async Task<IActionResult> Put(
        int id,
        ClienteUpdateDto clienteDto)
    {
        var cliente = await _context.Clientes.FindAsync(id);

        if (cliente is null)
            return NotFound();

        cliente.Nome = clienteDto.Nome.Trim();
        cliente.Documento = clienteDto.Documento;
        cliente.Email = clienteDto.Email;
        cliente.Telefone = clienteDto.Telefone;
        cliente.Ativo = clienteDto.Ativo;

        await _context.SaveChangesAsync();

        return NoContent();
    } 
}