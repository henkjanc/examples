



class test($testvar = undef) {
  $message = $testvar ? {
    undef   => 'not defined',
    default => $testvar,
  }
  notify{ "Testvar: ${testvar}":}
}


class {'test': }
