def num_factors(num)
  (1..num).count { |factor| num % factor == 0 }
end

def anti_prime?(num)
  max = num_factors(num)
  (1...num).all? { |el| max > num_factors(el) }
end


#p anti_prime?(24)   # true
#p anti_prime?(36)   # true
#p anti_prime?(48)   # true
#p anti_prime?(360)  # true
#p anti_prime?(1260) # true
#p anti_prime?(27)   # false
#p anti_prime?(5)    # false
#p anti_prime?(100)  # false
#p anti_prime?(136)  # false
#p anti_prime?(1024) # false


def matrix_addition(mtr_1, mtr_2)
  matrix = Array.new(mtr_1.length) { Array.new }

  (0...mtr_1.length).each do |i_1|
    (0...mtr_1[0].length).each do |i_2|
      matrix[i_1][i_2] = mtr_1[i_1][i_2] + mtr_2[i_1][i_2]
    end
  end

  matrix
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

#p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
#p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
#p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
#p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def factors(num)
  (1..num).select { |factor| num % factor == 0 }
end

def mutual_factors(*nums)
  nums.map { |el| factors(el) }.inject(:&)
end



#p mutual_factors(50, 30)            # [1, 2, 5, 10]
#p mutual_factors(50, 30, 45, 105)   # [1, 5]
#p mutual_factors(8, 4)              # [1, 2, 4]
#p mutual_factors(8, 4, 10)          # [1, 2]
#p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
#p mutual_factors(12, 24, 64)        # [1, 2, 4]
#p mutual_factors(22, 44)            # [1, 2, 11, 22]
#p mutual_factors(22, 44, 11)        # [1, 11]
#p mutual_factors(7)                 # [1, 7]
#p mutual_factors(7, 9)              # [1]

def tribonacci_number(n)
  return 1 if n == 1 || n == 2
  return 2 if n == 3

  tribonacci_number(n - 1) + tribonacci_number(n - 2) + tribonacci_number(n - 3)
end

#p tribonacci_number(1)  # 1
#p tribonacci_number(2)  # 1
#p tribonacci_number(3)  # 2
#p tribonacci_number(4)  # 4
#p tribonacci_number(5)  # 7
#p tribonacci_number(6)  # 13
#p tribonacci_number(7)  # 24
#p tribonacci_number(11) # 274

def matrix_addition_reloaded(*matrices)
  matrix_0 = matrices[0]
  return nil if matrices.any? { |m| m.length != matrix_0.length }

  new_matrix = Array.new(matrix_0.length) { Array.new(matrix_0[0].length, 0) }
  
  matrices.inject(new_matrix) do |mtr_1, mtr_2|
    matrix_addition(mtr_1, mtr_2)
  end
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil