defmodule Conta.Event.TransactionCreated.Entry do
  use TypedEctoSchema
  import Ecto.Changeset

  @primary_key false

  @typep currency() :: atom()

  @derive Jason.Encoder
  typed_embedded_schema do
    field :description, :string
    field :account_name, {:array, :string}
    field :credit, Money.Ecto.Amount.Type, default: Money.new(0)
    field :debit, Money.Ecto.Amount.Type, default: Money.new(0)
    field :balance, Money.Ecto.Amount.Type, default: Money.new(0)
    field(:change_currency, Money.Ecto.Currency.Type, default: :EUR) :: currency()
    field :change_credit, Money.Ecto.Amount.Type, default: Money.new(0)
    field :change_debit, Money.Ecto.Amount.Type, default: Money.new(0)
    field :change_price, :decimal, default: 1.0
  end

  @required_fields ~w[description account_name balance]a
  @optional_fields ~w[credit debit change_currency change_credit change_debit change_price]a

  @doc false
  def changeset(model \\ %__MODULE__{}, params) do
    model
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
