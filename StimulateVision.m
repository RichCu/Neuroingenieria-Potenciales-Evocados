function [ chkb0, chkb1, img_handle ] = StimulateVision(state, chkb0, chkb1, img_handle, dWidth, dLength)
%StimulateVision Create a checkerboard visual stimulus
%   Create a checkerboard pattern for visual stimulation. 
%   Args:
%       state (real scalar): Control which tiles are black and which are
%                               white. Valid values are 0 and 1.
%       chkb0 (real 3D matrix): RGB checkerboard pattern (normalized to
%                               0-1). If a scalar is received, it
%                               automatically creates a pattern.
%       chkb1 (real 3D matrix): Inverted RGB checkerboard pattern
%                               (normalized to 0-1). If a scalar is
%                               received, it automatically creates a
%                               pattern.
%       img_handle (real scalar): Handle for the current image object. If
%                                   it receives -1 an image will be
%                                   initialized.
%       dWidth (real scalar): Half the width of the middle red cross.
%                               Defaults to 2.
%       dLength (real scalar): Half the length of the middle red cross.
%                               Deaults to 10.
%   Returns:
%       chkb0 (real 3D matrix): RGB checkerboard pattern (normalized to
%                               0-1).
%       chkb1 (real 3D matrix): Inverted RGB checkerboard pattern
%                               (normalized to 0-1).
%       img_handle (real scalar): Handle for the current image object.
    
    % Parameter validation and tile ordering
    if (~exist('dWidth', 'var'))
        dWidth = 2;     % Cross has width of 2*dWidth
    end
    if (~exist('dLength', 'var'))
        dLength = 10;   % Cross has length of 2*dLength
    end
    % If no checkerbord pattern was provided create one
    if (~exist('chkb0', 'var')) || (~exist('chkb1', 'var') || (length(chkb0) == 1) || (length(chkb1) == 1))
        [chkb0, chkb1] = CreateCheckboard(dWidth, dLength);
    end
    % If no valid image handle was provided (-1), create an image object
    if (~exist('img_handle', 'var') || img_handle < 0)
        img_handle = image(chkb0)
    end
    % Update image object
    if state == 0
        set(img_handle, 'CData', chkb0);
    elseif state == 1
        set(img_handle, 'CData', chkb1);
    end
    return
end

