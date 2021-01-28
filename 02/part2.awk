#! /usr/bin/awk -f

{input[++n] = $1}

END {
    for (i = 0; i <= n; i++)
        for (j = 0; j <= n && j != i; j++) {
            s1 = input[i]
            s2 = input[j]
            len = length(s1)  # assuming the same length
            diffs = 0

            for (pos = 1; pos <= len; pos++)
                if (substr(s1, pos, 1) != substr(s2, pos, 1))
                    diffs++

            if (diffs == 1) {
                correct_1 = s1
                correct_2 = s2
                correct_len = len
            }
        }

    for (pos = 1; pos <= correct_len; pos++) {
        c1 = substr(correct_1, pos, 1)
        c2 = substr(correct_2, pos, 1)
        if (c1 == c2)
            printf "%c", c1
    }
    printf "\n"
}
