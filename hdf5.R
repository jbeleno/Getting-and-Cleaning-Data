library(rhdf5)
crearArchivo <- function(){
    created = h5createFile("./data/ejemplo.h5")
    created
}

crearGrupos <- function(){
    created = h5createGroup("./data/ejemplo.h5", "foo")
    created = h5createGroup("./data/ejemplo.h5", "baa")
    created = h5createGroup("./data/ejemplo.h5", "foo/foobaa")
    h5ls("./data/ejemplo.h5")
}

escribirGrupos <- function(){
    A = matrix(1:10, nr=5, nc=2)
    h5write(A, "./data/ejemplo.h5", "foo/A")
    B = array(seq(0.1,2.0, by=0.1),dim=c(5,2,2))
    attr(B, "scale") <- "liter"
    h5write(B,"./data/ejemplo.h5", "foo/foobaa/B")
    h5ls("./data/ejemplo.h5")
}

escribirDataset <- function(){
    df = data.frame(1L:5L, seq(0,1, length.out = 5),
                    c("ab", "cde", "fghi", "a", "s"), stringsAsFactors = FALSE)
    h5write(df, "./data/ejemplo.h5", "df")
    h5ls("./data/ejemplo.h5")
}

leerDatos <- function(){
    readA = h5read("./data/ejemplo.h5", "foo/A")
    readB = h5read("./data/ejemplo.h5", "foo/foobaa/B")
    readdf = h5read("./data/ejemplo.h5", "df")
    readA
}

leer_escribir_pedazos <- function(){
    h5write(c(12,13,14),"./data/ejemplo.h5", "foo/A", index = list(1:3,1) )
    h5read("./data/ejemplo.h5", "foo/A")
}