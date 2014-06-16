
import os

def list_files(path):
    result = []
    for name in os.listdir(path):
        if os.path.isdir(name):
            new_path = path + "\\" + name
            result = result + list_files(new_path)
        else:
            result.append(path + "\\" + name)
    return result


print list_files('.')
