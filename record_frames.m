function handles=record_frames(handles)
    %% Record Frames
    if handles.record.Value==1
        handles.file_data.movie.frame(handles.file_data.movie.frame_index)=getframe(gcf);
        handles.file_data.movie.frame_index=handles.file_data.movie.frame_index+1;
    end
end