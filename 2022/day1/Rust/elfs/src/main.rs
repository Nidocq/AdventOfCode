use std::{fs, iter::Sum};
fn main() {
    let data = fs::read_to_string("input.txt").expect("Unable to read file");
    let binding = data.replace("\n", " ");
    let mut lists_sums : Vec<i32> = binding
                            // Splitting strings into list strings
                            .split("  ")
                            .map(| str_list | (str_list).split(" ").collect::<Vec<&str>>())
                            // collecting each string number into 
                            .map(| str_numbers | str_numbers.iter().map
                            ( | num | {println!("{}", num);return num.parse::<i32>().unwrap()}).collect::<Vec<i32>>().iter().sum() )
                            .collect::<Vec<i32>>();
    lists_sums.sort();
    lists_sums.reverse();
    println!("{}", lists_sums[0]);

}

