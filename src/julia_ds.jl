# End Goal: Julia + Rust stack for development
name=10
print(name)
typeof(name)
# prints the first 5 methods possible with Int64
first(methodswith(Int64),5)
# structs in julia
struct Lean 
    jest::String
    title::String
    year_of_birth::Int64
    fast::Bool
end
# to get all the fields in the struct
fieldnames(Lean)
# creating struct values
julia = Lean("alwinsDen","julia new",1212,false)
rust = Lean("rust","rust new",3253,true)
# creating mutatable structs
mutable struct MutableLanguage1
    age::Int64
    place::String
    origin_date::Int64
end
julia_mutable = MutableLanguage1(43,"test",2013)
julia_mutable.age = 43
julia_mutable.origin_date = 2014
println(julia_mutable)
# boolean operators
!true
(false && true) || (!false)
(6 isa Int64) && (6 isa Real)
1==1
1>=10
1==1.0
(1!=10) || (3.14 <= 2.71)
# functions in julia
function test_funct(arg1, arg2) 
    result = arg1 * arg2 
    return result 
end
test_funct(32,43)
# function with same name that run based on input type
function square(arg1::Float64)
    return arg1 * arg1
end 
function square(arg1::Int64)
    return arg1 * arg1
end
square(3)
square(3.32)
methods(square) #to get the methods related to `square`
# abstract type parameter
# This will take into consideration all floats
function squared(arg1::AbstractFloat)
    return round(arg1)
end
squared(Float16(1.1))
squared(Float64(1.1))
# Base.show() for nice printing capabilities for the struct (COOL!)
Base.show(io::IO, l::MutableLanguage1) = print(
    io, "The age is ", l.age, ", ",
    "the place of origin is ", l.place,", ",
    "and finally the year is ", l.place
)
julia_mutable
# multiple return values to a function
function add_multiple(x,y) 
    addition = x + y
    multiplication = x * y
    return addition, multiplication
end
add_value, multi_value = add_multiple(3,4)
add_value, multi_value
# keyword arguments
# the below line means: AbstractFloat is also Real number and Integer is also a Real Number
AbstractFloat <: Real && Integer <: Real
function logarithm(x::Real, base::Real=2.71828)
    return log(base, x)
end
logarithm(10)
# anonymous functions ie. shorthand functions
map(x->2.71812^x, logarithm(2))
# conditional If-Else-Elseif
a=1
b=2
if a < b
    "a is less than b"
elseif a > b
    "a is greater than b"
else
    "a is equal to b"
end
# comparing function
function compare(a,b)
    if a < b
        "a is less than b"
    elseif a > b
        "a is greater than b"
    else
        "a is equal to b"
    end  
end
compare(32,12)
# for loop
for i in 1:10
    println(i)
end
# while loop
n=0
while n<3
    global n+=1
end
n
# native datastructures
first(methodswith(String),5)
# broadcasting operations
a=[1,2,4,5]
a .+ 1 #add 1 each element
# broadcasting functions
logarithm.([1,2,4]) #each element is passed through logarithm
# functions with a bang !
function add_one!(V)
    for i in eachindex(V)
        V[i]+=1
    end
    return nothing
end
println(add_one!([3,5,6]))
# Strings
typeof("Here is test")
# String concatenation method 1
hello = "hello "
goodbye = "alwin"
hello * goodbye
# String concatenation method 2
join(["Hello ","Alwin T"])
# String concatenation method 3
"$hello $goodbye"
# string manipulation
julia_string = "hey Hey there this here is a test string"
contains(julia_string, "hey")
startswith(julia_string, "hey")
endswith(julia_string,"stribg")
lowercase(julia_string) #converts entire string to lowercase
uppercase(julia_string)
titlecase(julia_string) #for first letters of words
lowercasefirst(julia_string)
split(julia_string," ")
# parse to string
numerical = 2304239234
string(numerical)
typeof(parse(Int64, "123"))
tryparse(Int64, "A") #this will return `nothing`
#tuples in Julia
my_tuples = (1,3,5,"test")
my_tuples[2]
map((x,y,z)->x*y-z, 2,3,4)
#named_tuples
test_tuple = (s=1, v=2)
test_tuple.s
#ranges
[x for x in 1:10]
#start:ste:stop ranges
1.0:.2:10.0
# collect
collect(1:10)
# arrays
my_array = ["text",1,"sample"]
# array contruction using undefined 1D
my_vector = Vector{Float64}(undef,10)
# array contruction using undefined 2D
my_big_vector = Matrix{Float64}(undef,10,2)
# aliases
my_vector_zeroes = zeros(10)
my_vector_ones = ones(Int64,10,2)
# fill! 
my_matrix = Matrix{Float64}(undef,2,2)
fill!(my_matrix,3.14)
# creating matrices
test = [[1,2]
[3,4]]
Bool[0,1,1,0]
[ones(Int64,2,2) zeros(Int64,2,2)]
# weird matrix formations
[ones(Int64,2,2) [2;3]
[3 4]          5]
# multiple loops
[(x,y) for x in 1:10 for y in 1:2]
# conditional
[x for x in 0:10 if iseven(x)] #isodd is also available
# concatenate arrays #dims is the dimention
cat(ones(Int64,2),zeros(Float64,2),dims=2)
# shorthand of dims=1
vcat(ones(Int64,5,4), zeros(Float64,3,4))
# dims=2
hcat(ones(Int64,4,4), zeros(Float64,4,3))
# length
test_vec = ones(Float64,10,5)
length(test_vec)
size(test_vec)
# array indexing and slicing
my_example_vector = [1,2,4,5]
my_example_vector = [[1 2 3]
                    [4 5 6]
                    [7 8 9]]
my_example_vector[3,1]
# indexing keywords
my_example_vector[end-1]
my_example_vector[begin,end-1] #first row, second last element
