using Microsoft.AspNetCore.Mvc;

namespace GestaoComercial.Api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class StatusController : ControllerBase
{
    [HttpGet]
    public IActionResult Get()
    {
        return Ok(new
        {
            sistema = "Gestão Comercial",
            api = "Funcionando pelo C#"
        });
    }

    [HttpGet("saudacao/{nome}")]
    public IActionResult Saudacao(string nome)
    {
        return Ok(new
        {
            mensagem = $"Olá, {nome}! A API recebeu seu nome."
        });
    }
}