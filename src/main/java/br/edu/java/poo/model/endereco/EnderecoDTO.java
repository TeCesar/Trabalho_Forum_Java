package br.edu.java.poo.model.endereco;

public class EnderecoDTO {
    private int id;
    private String rua;
    private int numeroCasa;
    private String bairro;
    private String cidade;
    private UfDTO ufDTO;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public int getNumeroCasa() {
        return numeroCasa;
    }

    public void setNumeroCasa(int numeroCasa) {
        this.numeroCasa = numeroCasa;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public UfDTO getUfDTO() {
        return ufDTO;
    }

    public void setUfDTO(UfDTO ufDTO) {
        this.ufDTO = ufDTO;
    }
}
