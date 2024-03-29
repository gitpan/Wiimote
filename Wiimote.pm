        package Linux::Input::Wiimote;

        use strict;
        use warnings;

        require Exporter;
        require DynaLoader;

        use constant {
            WIIMOTE_KEYS_OFFSET_HOME      => 0,
            WIIMOTE_KEYS_OFFSET_RESERVED1 => 1,
            WIIMOTE_KEYS_OFFSET_RESERVED2 => 2,
            WIIMOTE_KEYS_OFFSET_MINUS     => 3,
            WIIMOTE_KEYS_OFFSET_A         => 4,
            WIIMOTE_KEYS_OFFSET_B         => 5,
            WIIMOTE_KEYS_OFFSET_1         => 6,
            WIIMOTE_KEYS_OFFSET_2         => 7,
            WIIMOTE_KEYS_OFFSET_RESERVED3 => 8,
            WIIMOTE_KEYS_OFFSET_RESERVED4 => 9,
            WIIMOTE_KEYS_OFFSET_RESERVED5 => 10,
            WIIMOTE_KEYS_OFFSET_PLUS      => 11,
            WIIMOTE_KEYS_OFFSET_UP        => 12,
            WIIMOTE_KEYS_OFFSET_DOWN      => 13,
            WIIMOTE_KEYS_OFFSET_RIGHT     => 14,
            WIIMOTE_KEYS_OFFSET_LEFT      => 15,
        };

        sub wiimote_discover {
            my $self = shift;
            return c_wiimote_discover();
        }

        sub wiimote_connect {
            my $self = shift;
            my $id   = shift;
            c_wiimote_connect($id);
        }

        sub is_open {
            my $self = shift;
            return c_is_open();
        }

        sub wiimote_update {
            my $self = shift;
            c_wiimote_update();
        }

        sub wiimote_disconnect {
            my $self = shift;
            c_wiimote_disconnect();
        }

        sub get_wiimote_rumble {
            my $self = shift;
            return c_get_wiimote_rumble();
        }

        sub set_wiimote_rumble {
            my $self = shift;
            my $setr = shift;
            c_set_wiimote_rumble( $setr );
        }

        sub get_wiimote_ir {
            my $self = shift;
            return c_get_wiimote_ir();
        }

        sub set_wiimote_ir {
            my $self = shift;
            my $setr = shift;
            c_set_wiimote_ir( $setr );
        }

        sub get_wiimote_ext_nunchuk_joyx {
            my $self = shift;
            return c_get_wiimote_ext_nunchuk_joyx();
        }

        sub get_wiimote_ext_nunchuk_joyy {
            my $self = shift;
            return c_get_wiimote_ext_nunchuk_joyy();
        }

        sub get_wiimote_ext_nunchuk_keys_c {
            my $self = shift;
            return c_get_wiimote_ext_nunchuk_keys_c();
        }

        sub get_wiimote_ext_nunchuk_keys_z {
            my $self = shift;
            return c_get_wiimote_ext_nunchuk_keys_z();
        }

        sub get_wiimote_ext_nunchuk_axis_x {
            my $self = shift;
            return c_get_wiimote_ext_nunchuk_axis_x();
        }

        sub get_wiimote_ext_nunchuk_axis_y {
            my $self = shift;
            return c_get_wiimote_ext_nunchuk_axis_y();
        }

        sub get_wiimote_ext_nunchuk_axis_z {
            my $self = shift;
            return c_get_wiimote_ext_nunchuk_axis_z();
        }

        sub get_wiimote_axis_x {
            my $self = shift;
            return c_get_wiimote_axis_x();
        }

        sub get_wiimote_axis_y {
            my $self = shift;
            return c_get_wiimote_axis_y();
        }

        sub get_wiimote_axis_z {
            my $self = shift;
            return c_get_wiimote_axis_z();
        }

        sub get_wiimote_tilt_x {
            my $self = shift;
            return c_get_wiimote_tilt_x();
        }

        sub get_wiimote_tilt_y {
            my $self = shift;
            return c_get_wiimote_tilt_y();
        }

        sub get_wiimote_tilt_z {
            my $self = shift;
            return c_get_wiimote_tilt_z();
        }

        sub activate_wiimote_accelerometer {
            my $self = shift;
            c_activate_wiimote_accelerometer();
        }

        sub deactivate_wiimote_accelerometer {
            my $self = shift;
            c_deactivate_wiimote_accelerometer();
        }

        sub get_wiimote_keys_home {
            my $self = shift;
            return _get_wiimote_offset_bit(WIIMOTE_KEYS_OFFSET_HOME);
        }

        sub get_wiimote_keys_minus {
            my $self = shift;
            return _get_wiimote_offset_bit(WIIMOTE_KEYS_OFFSET_MINUS);
        }

        sub get_wiimote_keys_a {
            my $self = shift;
            return _get_wiimote_offset_bit(WIIMOTE_KEYS_OFFSET_A);
        }

        sub get_wiimote_keys_b {
            my $self = shift;
            return _get_wiimote_offset_bit(WIIMOTE_KEYS_OFFSET_B);
        }

        sub get_wiimote_keys_1 {
            my $self = shift;
            return _get_wiimote_offset_bit(WIIMOTE_KEYS_OFFSET_1);
        }

        sub get_wiimote_keys_2 {
            my $self = shift;
            return _get_wiimote_offset_bit(WIIMOTE_KEYS_OFFSET_2);
        }

        sub get_wiimote_keys_plus {
            my $self = shift;
            return _get_wiimote_offset_bit(WIIMOTE_KEYS_OFFSET_PLUS);
        }

        sub get_wiimote_keys_up {
            my $self = shift;
            return _get_wiimote_offset_bit(WIIMOTE_KEYS_OFFSET_UP);
        }

        sub get_wiimote_keys_down {
            my $self = shift;
            return _get_wiimote_offset_bit(WIIMOTE_KEYS_OFFSET_DOWN);
        }

        sub get_wiimote_keys_right {
            my $self = shift;
            return _get_wiimote_offset_bit(WIIMOTE_KEYS_OFFSET_RIGHT);
        }

        sub get_wiimote_keys_left {
            my $self = shift;
            return _get_wiimote_offset_bit(WIIMOTE_KEYS_OFFSET_LEFT);
        }

        sub get_wiimote_keys_bits {
            my $self = shift;
            return dec2bin16(c_get_wiimote_keys_raw_bits() );
        }

        sub _get_wiimote_offset_bit {
            my $offset = shift;
            return substr( dec2bin16( c_get_wiimote_keys_raw_bits() ), $offset, 1 );
        }

        sub dec2bin16 {
            my $str = unpack( "B32", pack( "N", shift ) );
            return substr( $str, 16, 16 );
        }

        sub new {
            my $self = {};
            bless($self);    # but see below
            return $self;
        }

        our @ISA = qw(Exporter DynaLoader);

        # Items to export into callers namespace by default. Note: do not export
        # names by default without a very good reason. Use EXPORT_OK instead.
        # Do not simply export all your public functions/methods/constants.
        our @EXPORT = qw(

        );
        our $VERSION = '0.01';

        bootstrap Wiimote $VERSION;

        # Preloaded methods go here.

# Autoload methods go after __END__, and are processed by the autosplit program.

        1;
        __END__
        # Below is the stub of documentation for your module. You better edit it!
=head1 NAME

 Wiimote

=head1 SYNOPSIS

 This is a perl interface to the C library libcwiimote ( http://sourceforge.net/projects/libwiimote/ ).
 It implements most of that API and provides access to most functions of the wiimote.

 libcwiimote must be installed and the bluetooth dameon must be running

 Auto discovery is not yet built in.  You must know the id of your wiimote.  You can use hcitool scan
 to find the id.

 Methods:

 wiimote_connect( ID OF YOUR WIIMOTE ): pass in the id of your wiimote such as '00:19:1D:75:CC:30'.  Returns 0 on success
 wiimote_update : updates the wiimote.  Should be called often

 wiimote_discover: discovers and returns the id of the last wiimote it sees.  WARNING, this method has bugs and will segfault if it doesn't find a wii quickly
 set_wiimote_rumble:  starts/stops rumble.  Pass in 1 to start, 0 to stop
 set_wiimote_ir:  starts/stops ir sensor.  Pass in 1 to start, 0 to stop

 get_wiimote_tilt_x
 get_wiimote_tilt_y
 get_wiimote_tilt_z

 get_wiimote_axis_x
 get_wiimote_axis_y
 get_wiimote_axis_z

 get_wiimote_ext_nunchuk_axis_x
 get_wiimote_ext_nunchuk_axis_y
 get_wiimote_ext_nunchuk_axis_z

 get_wiimote_ext_nunchuk_joyx
 get_wiimote_ext_nunchuk_joyy

 IR sensor position (must first set_wiimote_ir(1) to start ir sensor) NOT YET FINISHED:
 get_wiimote_ir1_y
 get_wiimote_ir1_x
 get_wiimote_ir1_size

 get_wiimote_ir2_y
 get_wiimote_ir2_x
 get_wiimote_ir2_size

 get_wiimote_ir3_y
 get_wiimote_ir3_x
 get_wiimote_ir3_size

 get_wiimote_ir4_y
 get_wiimote_ir4_x
 get_wiimote_ir4_size

 Methods below return 0 or 1 depending on if key is pressed:

 get_wiimote_keys_home
 get_wiimote_keys_minus
 get_wiimote_keys_a
 get_wiimote_keys_b
 get_wiimote_keys_1
 get_wiimote_keys_2
 get_wiimote_keys_plus
 get_wiimote_keys_up
 get_wiimote_keys_down
 get_wiimote_keys_right
 get_wiimote_keys_left
 get_wiimote_keys_bits

=head1 Example 

 use Wiimote;

 my $wii = new Wiimote;

 $wii->wiimote_connect('00:19:1D:75:CC:30');

 while ( $wii->is_open() ) {
    $wii->wiimote_update();
    print "Wiimote Key bits: " . $wii->get_wiimote_keys_bits() . "\n";
 }

=head1 Todo
  Add support for multiple remotes (it is already in libcmote)
  Add auto descovery of wiimote 
  Add make test

=head1 Bugs
 wiimote_discover can cause a segfault
 
=head1 Author

   Chad Phillips chad@chadphillips.org http://www.windmeadow.com

=head1 License
 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 
=cut
