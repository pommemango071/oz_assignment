class Dog:
    def __init__(self,breed, name):
        self.breed = breed
        self.name = name

    def info(self):
        return f'품종: {self.breed}, 이름: {self.name}'