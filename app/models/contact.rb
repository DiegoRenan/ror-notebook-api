class Contact < ApplicationRecord
  belongs_to :kind
  
  def author
    "Jackson Pires"
  end

  def kind_description
    self.kind.description
  end

  #render sobreescrevendo o as_json. Aplicado para todas actions
  def as_json(options={})
    super(
      methods: [:author, :kind_description], 
      root: true,
      #include: :kind
      #include: { kind: { only: :description } }
    )
  end
end
