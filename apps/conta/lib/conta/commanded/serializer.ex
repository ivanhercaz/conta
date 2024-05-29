defmodule Conta.Commanded.Serializer do
  @moduledoc """
  Ensuring to keep the information about the struct the element belongs
  when serialize/deserialize it.
  """

  @doc """
  Perform the serialization of the term.
  """
  defdelegate serialize(term), to: Commanded.Serialization.JsonSerializer

  @doc """
  Convert the maps using the changeset (we assume they are Ecto schemas).
  """
  def deserialize("{}", []), do: %{}

  def deserialize(binary, config) do
    struct = String.to_existing_atom(config[:type])

    binary
    |> Jason.decode!()
    |> struct.changeset()
  end
end
