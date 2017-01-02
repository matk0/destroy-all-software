import os.path


filenames = {
        'gitconfig': '/Users/matejlukasik/.gitconfig',
        'vimrc': '/Users/matejlukasik/.vimrc'
}


def find_dotfile(dotfile_name):
    try:
        path = filenames[dotfile_name]
    except KeyError:
        path = '/Users/matejlukasik/.%s' % dotfile_name

    # IMPROVED VERSION
    try:
        return open(path).read()
    except IOError:
        return "File '%s' not found." % dotfile_name

    # ORIGINAL VERSION
    # if os.path.exists(path):
    #     return open(path).read()
    # else:
    #     return ''


print find_dotfile('gitconfig')
print find_dotfile('foobar')
