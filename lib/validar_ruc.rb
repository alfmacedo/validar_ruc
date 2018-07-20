require "validar_ruc/version"

module ValidarRuc
  # ValidarRuc.validar(100000000000)
  def self.validar(ruc)
    if ruc.to_s.length != 11
      return "RUC incorrecto, debe ser de 11 dígitos"
    end
    if !ruc.to_s.starts_with?("10", "15", "17", "20")
      return "RUC incorrecto, debe iniciar con 10, 15, 17 ó 20"
    end
    m = [5, 4, 3, 2, 7, 6, 5, 4, 3, 2]
    d = ruc.to_s[0..9].to_s.split("").map(&:to_i)
    sum = 0
    d.each_with_index do |xx, index|
      sum += xx * m[index]
    end
    div = sum / 11
    r = (11 - (sum - div.to_i * 11)).to_i
    r = (r == 10 ? 0 : r)
    r = (r == 11 ? 1 : r)
    if ruc.to_s.last.to_i == r.to_i
      return true
    else
      return "RUC incorrecto, el último dígito debería ser #{r}"
    end
  end
end
