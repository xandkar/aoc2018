#! /usr/bin/awk -f

{
    n = length($1)
    has_two = 0
    has_three = 0
    delete count

    for (i = 1; i <= n; i++)
        count[substr($1, i, 1)]++

    for (char in count) {
        if (count[char] == 2)
            has_two = 1
        else if (count[char] == 3)
            has_three = 1
    }

    if (has_two)
        two++
    if (has_three)
        three++
}

END {
    printf "%d\n", two * three
}
