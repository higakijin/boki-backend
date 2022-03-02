%w[3級 2級工業 2級商業].each do |name|
  Level.create!(name: name)
end
puts 'レベルを作成しました'
