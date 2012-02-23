Summary: SoftEnv manages environmental variables for complex environments.
Name: softenv
Version: M_VERSION
Release: 1
Copyright: University of Chicago 1999
Group: System Environment
Source: %{name}-%{version}.tar.bz2
BuildRoot: /tmp/%{name}-buildroot
BuildArchitectures: noarch

%description
SoftEnv is designed to automatically generate environment variables for
the user's shells based on how software packages are installed in the
larger system.  It does this by reading the user's "SOFTENVRC" file and
then creating shell scripts that are automatically read by the user's
startup shells.

%prep

%setup -q

%build
make all PREFIX=/usr

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/usr/share/doc/softenv-%{version}/html
mkdir -p $RPM_BUILD_ROOT/usr/share/doc/softenv-%{version}/txt
mkdir -p $RPM_BUILD_ROOT/etc/softenv
mkdir -p $RPM_BUILD_ROOT/etc/profile.d

make install PREFIX=/usr

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)
%doc CHANGES COPYRIGHT INSTALL README VERSION
%config /etc/softenv
%config /etc/profile.d
/usr/share/doc/softenv-%{version}/html
/usr/share/doc/softenv-%{version}/txt

%changelog
* Sun Aug 31 2003 Brian Elliott Finley <finley@mcs.anl.gov>
- First use -- create the world's first SoftEnv RPM, using M. Richey's spec file!

* Fri Jun 6 2003 Margaret Richey <richeym@acm.org>
- create rpm spec file
