defmodule Conta.Command.AccountTransaction.Entry do
  use TypedEctoSchema

  @primary_key false

  @typep currency() :: atom()

  typed_embedded_schema do
    field :description, :string
    field :account_name, {:array, :string}
    field :credit, :integer, default: 0
    field :debit, :integer, default: 0
    field(:change_currency, Money.Ecto.Currency.Type, default: :EUR) :: currency()
    field :change_credit, :integer, default: 0
    field :change_debit, :integer, default: 0
    field :change_price, :decimal, default: 1.0
  end
end
