defmodule Conta.AutomatorFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Conta.Automator` context.
  """
  use ExMachina.Ecto, repo: Conta.Repo

  def shortcut_factory do
    %Conta.Projector.Automator.Shortcut{
      name: "credit cash",
      automator: "default",
      description: "write spend cash down",
      code: "-- Lua code\n",
      language: :lua
    }
  end

  def shortcut_param_factory do
    %Conta.Projector.Automator.ShortcutParam{
      name: "amount",
      type: :money
    }
  end
end
