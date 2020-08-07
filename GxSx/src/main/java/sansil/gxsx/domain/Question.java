package sansil.gxsx.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Question {
	private int qno;
	private String quid;
	private String qsub;
	private String qcon;
	private String qreply;
}
