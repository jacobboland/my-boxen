# Remote Desktop from Mac to Windows
class apps::rdp {
  package { 'RDP':
    ensure   => installed,
    source   => 'http://download.microsoft.com/download/C/F/0/CF0AE39A-3307-4D39-9D50-58E699C91B2F/RDC_2.1.1_ALL.dmg',
    provider => 'pkgdmg'
  }
}
