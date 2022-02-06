# File with single pet
resource "random_pet" pet {
    length = 1
}

resource "local_file" single_pet_file {
    content = random_pet.pet.id
    filename = "/tmp/file-single-pet.txt"
}


# Multiple files with single pet
resource "random_pet" pets {
    count = 3
    length = 1
}

resource "local_file" pet_files {
    content = random_pet.pets[count.index].id
    filename = "/tmp/file-${random_pet.pets[count.index].id}.txt"
    count = length(random_pet.pets)
}


