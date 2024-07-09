# Read all vertices
/ *[0-9]/ { if (!($1 in a)) a[$1] = $1; } 
END { for (i in a) 
	if (i < length(a)) 
		printf("(v"  a[i] "Black | v" a[i] "Red | v" a[i] "White) & (~v" a[i] "Black | ~v" a[i] "Red) & (~v" a[i] "Black | ~v" a[i] "White) & (~v" a[i] "Red | ~v" a[i] "White) & ")
}

# Print last vertice clause without (&)
END {printf("(v"  a[length(a)] "Black | v" a[length(a)] "Red | v" a[length(a)] "White) & (~v" a[length(a)] "Black | ~v" a[length(a)] "Red) & (~v" a[length(a)] "Black | ~v" a[length(a)] "White) & (~v" a[length(a)] "Red | ~v" a[length(a)] "White)")}

# Print edge clauses
/ *[0-9] *-- * *[0-9]/ {printf("(~v" $1 "Black | ~v" $3 "Black) & (~v" $1 "Red | ~v" $3 "Red) & (~v" $1 "White | ~v" $3 "White) & ")}
