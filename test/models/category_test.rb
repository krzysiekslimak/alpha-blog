require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

def setup #umieszczamy tutaj obiekty które będą dostępne dla wszystkich testów
    @category = Category.new(name: "Sports")
end

test "category should be valid" do
    assert @category.valid? #polecenie sprawdzające czy powyższe zwróci true - czyli czy został utworzony nowy obiekt @category czyli czy tablica istnieje i jest prawidłowa (tworzy chwilowo obiekt w tablicy testowej)
end

test "name should be uniqe" do
    @category.save #zapisuje do tabeli
    @category2 = Category.new(name: "Sports") #stara się stworzyć nowy obiekt (o tej samej nazwie)
    assert_not @category2.valid?
end

test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
end

test "name should not be to long" do
    @category.name = "a" *26
    assert_not @category.valid?
end

test "name shouldn't be to short" do
    @category.name = "aa"
    assert_not @category.valid?
end

end