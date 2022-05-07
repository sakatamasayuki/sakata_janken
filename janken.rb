def hoi
  if $command_result == 1
    puts "\n（あなたのターン）あっちむいて..."
  elsif $command_result == 2
    puts "\n（相手のターン）あっちむいて..."
  else
    puts "エラー"
  end
  puts "0(上）1（下）2（左）3（右）"
  your_point = gets.to_s.chomp
  npc_point = rand(0..3).to_s

  case your_point
  when "0","1","2","3"
  else 
    puts "入力が不正です。終了します。"
    exit
  end

  puts "\nホイ！"
  puts "--------------------"
  puts "あなた:  #{your_point.gsub(/0|1|2|3/,"0" => "上", "1" => "下", "2" => "左", "3" => "右")}"
  puts "相手  :  #{npc_point.gsub(/0|1|2|3/,"0" => "上", "1" => "下", "2" => "左", "3" => "右")}"

  if your_point == npc_point
    $hoi_result = 1
  else
    $hoi_result = 2
  end
  puts "--------------------"
end

def janken
  puts "じゃんけん..."
  puts "0(ぐー）1（ちょき）2（ぱー）3（戦わない）"

  your_command = gets.to_s.chomp
  npc_command = rand(0..2).to_s

  case your_command
  when "3"
    puts "終了します。"
    exit
  when "0","1","2"
  else 
    puts "入力が不正です。終了します。"
    exit
  end

  puts "\nホイ！"
  puts "--------------------"
  puts "あなた:  #{your_command.gsub(/0|1|2/,"0" => "ぐー", "1" => "ちょき", "2" => "ぱー")}"
  puts "相手  :  #{npc_command.gsub(/0|1|2/,"0" => "ぐー", "1" => "ちょき", "2" => "ぱー")}"
  puts "--------------------"

  if your_command == npc_command
    puts "あいこだよー"

  elsif your_command == "0" && npc_command == "1"\
    or your_command == "1" && npc_command == "2"\
    or your_command == "2" && npc_command == "0"
      $command_result = 1
      puts hoi
    if $hoi_result == 1
      puts "You win!!"
    elsif $hoi_result == 2
      puts "もう一度！"
    else
      puts "エラー"
    end
  else
    $command_result = 2
    puts hoi
    if $hoi_result == 1
      puts "You lose..."
    elsif $hoi_result == 2
      puts "もう一度！"
    else
      puts "エラー"
    end
  end
end

while true do
  puts janken
end