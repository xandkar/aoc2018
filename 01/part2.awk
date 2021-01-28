#! /usr/bin/awk -f

{input[n++] = $1}

END {
    for (i = 0; ; i = (i+1) % n) {
        if (++seen[sum += input[i]] > 1) {
            print sum
            exit 0
        }
    }
}
