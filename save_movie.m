function save_movie(handles)
    [file,path]=uiputfile('*.mp4');
    filepath=fullfile(path,file);
    v=VideoWriter(filepath,'MPEG-4');
    v.FrameRate=5;
    v.Quality=90;
    open(v)
    writeVideo(v,handles.file_data.movie.frame);
    close(v)
    disp(['User saved: ', filepath]);


end