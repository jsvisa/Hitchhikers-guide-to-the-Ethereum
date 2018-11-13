import os
import time
import tinify
tinify.key = os.environ['TINIFY_ACCESS_KEY']

src_path = './assets'
src_meta = '{}/.meta'.format(src_path)

prev_optimized = []
if os.path.exists(src_meta):
    with open(src_meta, 'r') as fp:
        line = fp.readline()
        while line:
            prev_optimized.append(line.strip())
            line = fp.readline()

for f in os.listdir(src_path):
    if not f.endswith('.png') or f in prev_optimized:
        continue
    src = os.path.join(src_path, f)
    dst = "{}.tinify".format(src)
    if os.path.exists(src):
        start = time.time()
        tinify.from_file(src).to_file(dst)

        os.system('mv {} {}'.format(dst, src))
        with open(src_meta, 'a') as fp:
            fp.write('{}\n'.format(f))
        time_diff = int(time.time() - start)
        print("tinify {} success, elapsed: {}s".format(src, time_diff))
