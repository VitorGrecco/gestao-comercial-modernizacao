using System.ComponentModel.DataAnnotations;

namespace GestaoComercial.Api.DTOs;

public class ClienteUpdateDto
{
    [Required]
    [StringLength(120)]
    public string Nome { get; set; } = string.Empty;

    [StringLength(20)]
    public string? Documento { get; set; }

    [StringLength(150)]
    public string? Email { get; set; }

    [StringLength(20)]
    public string? Telefone { get; set; }

    public bool Ativo { get; set; }
}