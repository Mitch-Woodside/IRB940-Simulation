function save_movie(handles)
    [file,path]=uiputfile('*.avi');
    filepath=fullfile(path,file);
    v=VideoWriter(filepath);
    v.FrameRate=1;
    v.Quality=90;
    open(v)
    writeVideo(v,handles.file_data.movie.frame);
    close(v)
    disp(['User saved: ', filepath]);


end