require 'rails_helper'

describe 'GameFormatter' do

  let!(:game) { Game.create }

  it 'should return game object' do
    results = GameFormatter.show(game, nil, nil)
    expect(results.class).to eq(Array)
  end

  it 'should hide all values under unknown text' do
    results = GameFormatter.show(game, nil, nil)
    expect(results.map { |field| field.value }).to all (eq("unknown"))
  end

  it 'reveals one field' do
    field1 = game.state[:board].fields.first
    results = GameFormatter.show(game, field1.id, nil)
    expect(results.select{|field| field.id == field1.id}.first.value).to eq field1.value
  end

  it 'reveals two fields' do
    field1 = game.state[:board].fields.first
    field2 = game.state[:board].fields.last
    results = GameFormatter.show(game, field1.id, field2.id)
    expect(results.select{|field| field.id == field1.id}.first.value).to eq field1.value
    expect(results.select{|field| field.id == field2.id}.first.value).to eq field2.value
  end
end