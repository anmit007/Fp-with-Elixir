defmodule Cards do

  @moduledoc """
    provides methods for creating and handling a deck iof cards
  """

  @doc """
    Interface to create deck of playing cards
  """
  def create_deck do
    values =  ["Ace","Two","Three","Four","Five","King"]
    suits = ["Spades","Clubs","Hearts","Diamonds"]
      for suit <-suits,value <-values do
        "#{value} of #{suit}"
      end
  end
@doc """
  Randomly shuffles your deck
"""
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

@doc """
  checks if a card is present in a deck

## Examples

    iex> deck = Cards.create_deck()
    iex> Cards.contains?(deck,"Ace of Spades")
    true

"""

  def contains?(deck,card) do
    Enum.member?(deck,card)
  end

@doc """
    Deal or distribute a card from deck with hand_size
"""

  def deal(deck,hand_size) do
    Enum.split(deck,hand_size)
  end
@doc """
    Saves deck to file storage
"""
  def save(deck,fileName) do
      binary = :erlang.term_to_binary(deck);
      File.write(fileName,binary);
  end

@doc """
  Loads deck from file storage
"""

  def load(filename) do
      case File.read(filename) do
          {:ok,binary} -> :erlang.binary_to_term binary
          {:error,reason} -> "File doesnot exists,Something went wrong,#{reason}"
      end
  end

  def create_hand(handSize)do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(handSize)
  end
end
