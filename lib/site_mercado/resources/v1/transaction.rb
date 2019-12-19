module SiteMercado
  class Transaction
    DICTIONARY = {
      bandeira: :flag,
      inicioCartao: :first_digits,
      fimCartao: :last_digits,
      adquirente: :owner,
      transactionCode1: :code1,
      transactionCode2: :code2,
      valor: :value,
      dataHora: :date_time
    }.freeze

    ATTR = %i[
      flag
      first_digits
      last_digits
      owner
      code1
      code2
      value
      date_time
    ]

    def initialize(params)
      ATTRS.each do |attr|
        translated = DICTIONARY.key(attr)
        value = params.send(translated) if translated
        instance_variable_set("@#{attr}", value) if value
      end
    end
  end
end
