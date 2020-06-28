cask 'seagate-paragon-ntfs' do
  version '15'
  sha256 :no_check # required as upstream package is updated in-place

  url "https://www.seagate.com/files/www-content/support-content/external-products/backup-plus/_shared/downloads/NTFS_for_Mac.dmg"
  name 'Seagate Paragon NTFS for Mac'
  homepage 'https://www.seagate.com/cn/zh/support/software/paragon/'

  auto_updates true

  installer manual: 'FSInstaller.app'

  uninstall kext:      'com.paragon-software.filesystems.ntfs',
            launchctl: 'com.paragon-software.ntfs*',
            pkgutil:   'com.paragon-software.pkg.ntfs',
            quit:      'com.paragon-software.ntfs*',
            signal:    [
                         ['KILL', 'com.paragon-software.ntfs.FSMenuApp'],
                         ['KILL', 'com.paragon-software.ntfs.notification-agent'],
                       ]

  zap trash: '~/Library/Preferences/com.paragon-software.ntfs.fsapp.plist'
end
