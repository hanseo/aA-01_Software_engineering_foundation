def my_reject(arr, &prc)
  arr.select { |ele| !prc.call(ele)}
end

def my_one?(arr, &prc)
  arr.count(&prc) == 1
end

def hash_select(hash, &prc)
  new_hash = {}
  hash.each do |k, v|
    new_hash[k] = v if prc.call(k, v)
  end

  new_hash
end

def xor_select(arr, prc_1, prc_2)
  both_true = arr.select { |el| prc_1.call(el) && prc_2.call(el) }
  arr -= both_true
  arr.select { |el| prc_1.call(el) || prc_2.call(el) }
end

def proc_count(num, arr)
  arr.count { |prc| prc.call(num) }
end