class Contact < ApplicationRecord
  #allow create Contatct without kind
  #belongs_to :kind, optional: true
  
  belongs_to :kind

  # def birthdate_br
  #   I18n.l(self.birthdate) unless self.birthdate.blank?
  # end

  def to_br
    { 
      name: self.name,
      email: self.email, 
      birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?) 
    }
  end
  
  # def author
  #   "Jackson Pires"
  # end

  # def kind_description
  #   self.kind.description
  # end

  # #render sobreescrevendo o as_json. Aplicado para todas actions
  # def as_json(options={})
  #   super(
  #     methods: [:author, :kind_description], 
  #     root: true,
  #     #include: :kind
  #     #include: { kind: { only: :description } }
  #   )
  # end

  # def hello
  #   I18n.t('hello')
  # end

  # def i18n
  #   I18n.default_locale
  # end
end
