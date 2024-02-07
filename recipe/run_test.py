import bz2


data = b"""\
Donec rhoncus quis sapien sit amet molestie. Fusce scelerisque vel augue
nec ullamcorper. Nam rutrum pretium placerat. Aliquam vel tristique lorem,
sit amet cursus ante. In interdum laoreet mi, sit amet ultrices purus
pulvinar a. Nam gravida euismod magna, non varius justo tincidunt feugiat.
Aliquam pharetra lacus non risus vehicula rutrum. Maecenas aliquam leo
felis. Pellentesque semper nunc sit amet nibh ullamcorper, ac elementum
dolor luctus. Curabitur lacinia mi ornare consectetur vestibulum."""

c = bz2.compress(data)
len(data) / len(c)  # Data compression ratio
# 1.513595166163142

d = bz2.decompress(c)
data == d  # Check equality to original object after round-trip


with bz2.open("myfile.bz2", "wb") as f:
    # Write compressed data to file
    unused = f.write(data)

with bz2.open("myfile.bz2", "rb") as f:
    # Decompress data from file
    content = f.read()

content == data
