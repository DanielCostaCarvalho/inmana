defmodule Inmana.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :email, :name]}

  schema "restaurants" do
    field :email, :string
    field :name, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:email, :name])
    |> validate_required([:email, :name])
    |> validate_format(
      :email,
      ~r/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    )
    |> validate_length(:name, min: 3)
    |> unique_constraint([:email])
  end
end
