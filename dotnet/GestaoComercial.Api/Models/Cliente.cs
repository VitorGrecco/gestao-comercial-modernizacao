using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GestaoComercial.Api.Models;

[Table("CLIENTE")]
public class Cliente
{
    [Key]
    [Column("ID_CLIENTE")]
    public int IdCliente { get; set; }

    [Column("NOME")]
    public string Nome { get; set; } = string.Empty;

    [Column("DOCUMENTO")]
    public string? Documento { get; set; }

    [Column("EMAIL")]
    public string? Email { get; set; }

    [Column("TELEFONE")]
    public string? Telefone { get; set; }

    [Column("ATIVO")]
    public bool Ativo { get; set; }

    [Column("DTH_CADASTRO")]
    public DateTime DataCadastro { get; set; }
}